package LAS32

import spinal.core._
import spinal.lib.misc.pipeline._

import scala.collection.mutable.ArrayBuffer

trait Service {}

trait DecoderService extends Service {
    def addSignal[T <: BaseType](signal: Payload[T], defaultValue: T): Unit
    def addSignal[T <: BaseType, S <: BaseType](signal: Payload[T], defaultValue: S => T): Unit
    def addInstruction(instruction: MaskedLiteral, signals: Seq[(Payload[_ <: BaseType], Any)]): Unit
}
