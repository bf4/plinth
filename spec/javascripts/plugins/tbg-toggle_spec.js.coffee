#=require plugins//tbg-toggle

describe 'Toggle:', ->
  beforeEach ->
      loadFixtures "plugins/tbg-toggle_fixture"

  describe 'A Test', ->
    it 'should pass', ->
      h2 = $('h2')
      expect(h2.text()).toEqual "Toggle Test  Fixture"
