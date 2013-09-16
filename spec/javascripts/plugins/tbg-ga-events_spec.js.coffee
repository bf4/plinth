#=require plinth/plugins/tbg-ga-events

root = this
describe "Google Analytics Events", ->
  beforeEach ->
    loadFixtures 'plugins/tbg-ga-events_fixture'
    window._gaq = []

  describe "a jQuery Plugin", ->
    it "should be defined on jquery object", ->
      expect( $('.btn').gaEvent() ).toBeDefined()

    it "should return element", ->
      expect( $('.btn').gaEvent()[0] ).toBe($('.btn')[0])

  describe "getting Events", ->

    it "can be initated for onload event", ->
      # This is an ugly way to test the content but as it is fired on load
      # then we must 'assume' this will be fired and test the internal working
      # of the plugin.
      $('[data-gaevent-load]').each ->
        $(this).gaEvent null, 'gaevent-load'

      $but = $('.btn3')
      $data = $but.data 'gaeventplugin'
      expect( $data.eventcontent ).toEqual('ping|ding')


    it "can be initated on click", ->
      $but = $('.btn').click()
      $data = $but.data 'gaeventplugin'
      expect( $data.eventcontent ).toEqual('ping|ding')

    it "can be initated via a form submit event", ->
      $form = $('.GAForm')
      $('body').trigger 'tbgform-success' , [$form]
      $data = $form.data 'gaeventplugin'
      expect( $data.eventcontent ).toEqual('ping|ding')

    it "should remove GAEvent hooks if no event is supplied", ->
      $but = $('.btn2').click()
      expect( $but.data('gaevent') ).not.toBeDefined()
      expect( $but.data('gaeventplugin') ).not.toBeDefined()


  describe "send Events", ->
    beforeEach ->
      root._gaq = []

    it "should add the event to the google array on click method", ->
      $('.btn').click()
      expect(root._gaq.length).toEqual(1)

    it "should add the event to the google array on form method", ->
      $('body').trigger 'tbgform-success' , [$('.GAForm')]
      expect(root._gaq.length).toEqual(1)

    it "should add the event to the google array on onLoad method", ->
      $('[data-gaevent-load]').each ->
        $(this).gaEvent null, 'gaevent-load'
      expect(root._gaq.length).toEqual(1)



  # Must be the last test as we unbind
  # the plugin to the data api
  describe "the data API", ->
    it "should be initated on click", ->
      $but = $('.btn').click()
      $data = $but.data('gaeventplugin')
      expect( $data ).toBeDefined()

    it "should be add the constructor to the data element", ->
      $but = $('.btn').click()
      $data = $but.data('gaeventplugin')
      expect( $data instanceof  $.fn.gaEvent.Constructor ).toBeTruthy()

    it "should not be initated if unattached via data API", ->
      $('body').off('.gaEvent.data-api')
      $but = $('.btn').click()
      $data = $but.data('gaeventplugin')
      expect( $data ).not.toBeDefined()
