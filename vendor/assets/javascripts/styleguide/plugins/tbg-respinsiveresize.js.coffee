# ============================================================
# TBG Responsive Resize v0.0.1
# http://URL
# ============================================================
# Copyright 2012 The Beans Group
#
# This plugin gives an event that is only fired once abrowser resize 
# finished. This stops your 'resize' event handler being called 
# continuously during a resize.
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

  class ResizeHandler
    constructor: ->
      $window = $(window)
      @resizeEvent = => 
        $window.trigger 'responsiveResize', @size()
      @resizeTimer = null

    resize: ->
      if @resizeTimer then clearTimeout @resizeTimer
      @resizeTimer = setTimeout @resizeEvent, 100

    size: ->
      window.getComputedStyle(document.body,':after').getPropertyValue('content').replace('-','') || ''

  $ ->
    resizeHandler = new ResizeHandler()
    $(window).on 'resize', ()=> resizeHandler.resize()

do ( plugin ) ->
  if typeof define is 'function' and define.amd
    # AMD. Register as an anonymous module.
    define(['jquery'], plugin);
  else
    # Browser globals
    plugin(jQuery)
