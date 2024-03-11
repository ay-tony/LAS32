package LAS32.Plugin

import LAS32._

trait Plugin {
    def register(pipeline: Pipeline): Unit
    def build(pipeline: Pipeline): Unit
}
