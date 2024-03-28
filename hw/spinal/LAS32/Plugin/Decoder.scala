package LAS32.Plugin

import scala.collection.mutable.LinkedHashMap
import spinal.core._
import spinal.lib.misc.pipeline._
import LAS32._

class Decoder(stageIndex: Int) extends Plugin with DecoderService {
    val signalDefaults = LinkedHashMap[Payload[? <: BaseType], Any]()
    val instructionSignals = LinkedHashMap[MaskedLiteral, Seq[(Payload[? <: BaseType], Any)]]()

    override def addSignal[T <: BaseType](signal: Payload[T], defaultValue: T): Unit = {
        signalDefaults += (signal -> defaultValue)
    }

    override def addSignal[T <: BaseType, S <: BaseType](signal: Payload[T], defaultValue: S => T): Unit = {
        signalDefaults += (signal -> defaultValue)
    }

    override def addInstruction(instruction: MaskedLiteral, signals: Seq[(Payload[_ <: BaseType], Any)]): Unit = {
        instructionSignals += (instruction -> signals)
    }

    override def register(pipeline: Pipeline): Unit = {}

    override def build(pipeline: Pipeline): Unit = {
        val fetcher = pipeline.getPlugin(classOf[Fetcher])
        import fetcher.INSTRUCTION

        val stage = pipeline.stages(stageIndex)
        new stage.Area {
            for ((signal, default) <- signalDefaults) {
                val value = default match {
                    case e: BaseType               => e
                    case e: (BaseType => BaseType) => e(INSTRUCTION)
                }
                up(signal).assignFrom(value)
            }
            for ((instruction, signals) <- instructionSignals) {
                when(INSTRUCTION === instruction) {
                    for ((signal, rawValue) <- signals) {
                        val value = rawValue match {
                            case e: BaseType               => e
                            case e: (BaseType => BaseType) => e(INSTRUCTION)
                        }
                        up(signal).assignFrom(value)
                    }
                }
            }
        }
    }
}
