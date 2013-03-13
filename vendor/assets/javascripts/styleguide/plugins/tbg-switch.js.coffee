# ============================================================
# TBG switch v0.0.1
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
  # 
  # @example How to ensure plugin self initialises on element
  #     <div data-switch="true"> ... </div>
  # 
  # @example How to group switches and allow them to change state of other switches in that group
  #     <div data-switch-group="[group name]"> ... </div>
  # 
  # @example How to toggle switch state
  #     <div data-switch-toggle="true"> ... </div>
  #
  class Switch 
    
    # Construct a new Switch instance
    #
    # Set this.parent, this.target, this.group and this.container elements for this.el; set this.toggle if attribute present
    #
    # @param [Object] element HTMLElement, this.el, that acts as the switch
    #
    constructor: ( @el ) ->
      @parent = if (parent = @el.parent('li')).length then parent else @el.parent()
      @content = @_getContent @el
      @toggle = @el.attr('data-switch-toggle')?
      @group = if ( groupName = @el.attr('data-switch-group') ) then $("[data-switch-group='#{groupName}']")
      @container = @el.closest 'ul'

    # @constant [String] string CSS active state class
    #
    activeClass: "is-active"

    _constructor: Switch

    # Click handler - If this.parent isn't active, close group if this.group defined and change state to true;
    #   if this.parent is active and this.toggle set then change state to false otherwise return undefined
    #
    click: ->
      if @parent.hasClass(@activeClass)
        if @toggle then return @changeStateTo false else return

      @_closeGroup() if @group

      @changeStateTo true

    # Change active state of target content - add or remove activeClass from content and parent elements
    #
    # @param [Boolean] boolean true to addClass to elements, false to removeClass from elements
    # @param [Object] array HTMLElement for target content, HTMLElement for parent element
    #
    changeStateTo: (action, elements =  [@content, @parent]) ->
      el["#{if action then "add" else "remove"}Class"] @activeClass for el in elements

    # Close group - if any content is active, get the target for that element's link and pass false and
    #   [active link content, active content] to switch group
    #
    # @private
    #
    _closeGroup: ->
      if (activeEl = @container.find("li.#{@activeClass}")).length
        activeContent = @_getContent activeEl.children('a')
        @changeStateTo false, [activeContent, activeEl]

    # Get target element to do switch on
    #
    # @private
    # @param [Object] object jQuery element to get target element from
    # @return [String] id selector for target element
    #
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
      $el = if (el =  $(e.target)).is('a') then el else el.closest('a')
      $el.switch('click')
      e.preventDefault()

do ( plugin ) ->
  if typeof define is 'function' and define.amd
    # AMD. Register as an anonymous module.
    define(['jquery'], plugin);
  else
    # Browser globals
    plugin(jQuery)
