require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  test "should have a quality that defaults to swill" do
    idea = Idea.new
    assert_equal("swill", idea.quality)
  end

  test "it is valid with a quality of swill" do
  ideas(:one).quality = "swill"

  assert(ideas(:one).valid?)
  end

  test "it is valid with a quality of plausible" do
    ideas(:one).quality = "plausible"

    assert(ideas(:one).valid?)
  end

  test "it is valid with a quality of genius" do
    ideas(:one).quality = "genius"

    assert(ideas(:one).valid?)
  end

  test "it is invalid with any other quality" do
    ideas(:one).quality = "invalid"

    refute(ideas(:one).valid?)
  end

  test "it should be invalid without a title or body" do
    idea_without_title_or_body = Idea.new

    refute(idea_without_title_or_body.valid?)
  end

  test "it should be invalid without a title" do
    idea_without_title = Idea.new(body: "body")

    refute(idea_without_title.valid?)
  end

  test "it shoudl be invalid without a body" do
    idea_without_body = Idea.new(title: "title")

    refute(idea_without_body.valid?)
  end

  test "it is valid with title and body" do
    idea = Idea.new(title: "title", body: "body")

    assert(idea.valid?)
  end
end
