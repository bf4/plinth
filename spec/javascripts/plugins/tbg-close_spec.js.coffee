#=require plinth/plugins/tbg-close

describe 'Close:', ->
  beforeEach ->
      loadFixtures "plugins/tbg-close_fixture"

  describe 'A good jquery plugin', ->
    it 'should exisit', ->
      expect($.fn.close).toBeDefined()

    it 'should return element', ->
      expect($(document.body).close()[0]).toEqual document.body

  describe 'instantiates class upon click', ->
    it "adds the instance to the data method", ->
      link = $('[data-close]')
      # We make the target fail so that it is
      # not removed before we can test
      link.attr 'href', "#noelement"
      link.click()
      expect( link.data('closePlugin') ).toBeDefined()

  describe 'Define variables upon instantiation', ->
    it "defines close target variable if set as data attribute", ->
      link = $('[data-close]')
      link.attr 'data-close', '#element101'
      link.close()
      expect( link.data('closePlugin').$target ).toEqual $('#element101')


    it "defines close target variable if set as href attribute", ->
      link = $('[data-close]').close()
      expect( link.data('closePlugin').$target ).toEqual $('#element101')

    it "defines close target variable as false if no element matches", ->
      link = $('[data-close]')
      link.attr 'href', "#noelement"
      link.close()
      expect( link.data('closePlugin').$target ).toBeFalsy()

  describe 'Events emmited', ->
    it "fires a close event when closing", ->
      spyOnEvent($('#element101'), 'close');
      $('[data-close]').click()
      expect('close').toHaveBeenTriggeredOn '#element101'

  describe 'Removes target', ->
    it "removes targte on click", ->
      expect( $('#element101') ).toExist()
      link = $('[data-close]')
      link.click()
      expect( $('#element101') ).not.toExist()


