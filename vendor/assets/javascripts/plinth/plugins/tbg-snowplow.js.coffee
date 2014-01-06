# ============================================================
# SnowplowEvents v0.0.1
# http://URL
# ============================================================
# Copyright 2013 The Beans Group
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

plugin = ($) ->

  "use strict"

  # Class definition
  #
  # @example How to use with HAML
  # %a{href: 'path/to/link', data: { spevent: 'category|action|label|prop|value' }}
  # @see https://github.com/snowplow/snowplow/wiki/2-Specific-event-tracking-with-the-Javascript-tracker#371-trackstructevent
  #
  # @example Ensure plugin self-initialises
  # <form data-spevent-load="true">...</form>
  #
  class SPEvent

    # SPEvent constructor
    #
    # @param el [DOMElement] 
    # @param content [String] Pipe-delimited string of event data
    # 
    constructor: (el, @content) ->
      $el = $(el)
      @sendEvent (if !(content.split('|') instanceof Array) then content.split('|') else [content]

    _constructor: SPEvent

    # Send event to Snowplow
    #
    # sendEvent :: [String] -> [String]
    #
    # @param evData [Array]
    #
    sendEvent: (data) ->
      evData = ['trackStructEvent'].concat data
      _snaq?.push evData

  # Remove data and assoc attributes from DOM element
  #
  # @param $el [DOMElement] jQuery-wrapped DOM el
  # @param ev [String] Data to be removed
  # 
  removeData = ($el, ev) ->
    $el.removeAttr('data-' + ev)
    $el.removeData(ev)
    
  # SPEvent plugin
  # 
  $.fn.spEvent = (option, type = "spevent") ->
    this.each ->
      $this = $(@)
      $this = if ($t = $(this)).is("[data-#{type}]") then $t else $t.closest("[data-#{type}]")
      data = $this.data 'speventplugin'
      if not (eventContent = $this.data(type)) then return removeData($this, type)
      if !data then $this.data 'speventplugin', (data = new SPEvent @, eventContent)
      if typeof option is 'string' then data[option].call $this

  $.fn.spEvent.Constructor = SPEvent

  # Data API
  # 
  $ ->
    $('body').on 'click.spEvent.data-api', '[data-spevent]' , ( e ) ->
      $this = $(e.target)
      $this.spEvent()

    $('body').on 'tbgform-success.spEvent.data-api', (e, $form)->
      $form.spEvent null, 'spevent-form'

    $('[data-spevent-load]').each ->
      $(this).spEvent null, 'spevent-load'
