# ============================================================
# TBG toggle v0.0.1
# http://URL
# ============================================================
# Copyright 2012 The Beans Group
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

plugin = ($)->

  "use strict"  

  # TOGGLE CLASS DEFINITION
  # ========================= 
  class Toggle 
    constructor: ( element ) ->
      $el = $(element)
  
    _constructor:  Toggle
  
    method : ->
      alert "I am a method"
  
  # TOGGLE PLUGIN DEFINITION
  # ==========================
  
  $.fn.toggle = ( option ) ->
    this.each ->
      $this = $(@)
      data = $this.data 'toggle'
      if !data then $this.data 'toggle', (data = new Toggle @)
      if typeof option is 'string' then data[option].call $this
  
  $.fn.toggle.Constructor = Toggle
  
  
  # DATA API
  # ===================================
  
  $ ->
    $('body').on 'click.toggle.data-api', '[data-toggleAction^=Action]', ( e ) ->
      $(e.target).toggle()

do ( plugin ) ->
  if typeof define is 'function' and define.amd
    # AMD. Register as an anonymous module.
    define(['jquery'], plugin);
  else
    # Browser globals
    plugin(jQuery)
