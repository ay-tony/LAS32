package LAS32

import scala.collection.mutable.ArrayBuffer

import spinal.core._
import spinal.lib.misc.pipeline._

import LAS32.Plugin._

trait Pipeline extends Component {
    val stages = ArrayBuffer[CtrlLink]()
    val plugins = ArrayBuffer[Plugin]()

    def getService[T <: Service](serviceClass: Class[T]) = {
        val service = plugins.filter(p => serviceClass.isAssignableFrom(p.getClass))
        service.head.asInstanceOf[T]
    }

    def getPlugin[T <: Plugin](pluginClass: Class[T]) = {
        val plugin = plugins.filter(p => pluginClass.isAssignableFrom(p.getClass))
        plugin.head.asInstanceOf[T]
    }

    def build(): Unit = {
        // register plugins
        plugins.foreach(_.register(this))

        // build plugins
        plugins.foreach(_.build(this))

        // build links between stages
        val links = for (i <- 0 until stages.length - 1) yield StageLink(stages(i).down, stages(i + 1).up)
        Builder(stages ++ links)
    }
}
