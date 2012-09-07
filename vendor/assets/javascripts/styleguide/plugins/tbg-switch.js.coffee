# ============================================================
# TBG switch v0.0.1
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

  # SWITCH CLASS DEFINITION
  # ========================= 
  class Switch 
    constructor: ( @el ) ->
      @parent = if (parent = @el.parent('li')).length then parent else @el.parent()
      @content = @_getContent @el
      @toggle = @el.attr('data-switch-toggle')?
      @group = if ( groupName = @el.attr('data-switch-group') ) then $("[data-switch-group='#{groupName}']")
      @container = @el.closest 'ul'

    activeClass: "is-active"

    _constructor:  Switch

    click: ->
      if @parent.hasClass(@activeClass)
        if @toggle then return @changeStateTo false else return

      @_closeGroup() if @group

      @changeStateTo true

    changeStateTo: (action, elements =  [@content, @parent]) ->
      el["#{if action then "add" else "remove"}Class"] @activeClass for el in elements

    _closeGroup: ->
      if (activeEl = @container.find(".#{@activeClass}")).length
        activeContent = @_getContent activeEl.children('a')
        @changeStateTo false, [activeContent, activeEl]

    _getContent: ( el ) ->
      $(el.attr 'href')



  # SWITCH PLUGIN DEFINITION
  # ==========================

  $.fn.switch = ( option ) ->
    this.each ->
      $this = $(@)
      data = $this.data 'switchPlugin'
      if !data then $this.data 'switchPlugin', (data = new Switch $this)
      if typeof option is 'string' then data[option]()
  
  $.fn.switch.Constructor = Switch
  
  
  # DATA API
  # ===================================
  
  $ ->
    $('body').on 'click.switch.data-api', '[data-switch]', ( e ) ->
      $(e.target).switch('click')
      e.preventDefault()

do ( plugin ) ->
  if typeof define is 'function' and define.amd
    # AMD. Register as an anonymous module.
    define(['jquery'], plugin);
  else
    # Browser globals
    plugin(jQuery)
