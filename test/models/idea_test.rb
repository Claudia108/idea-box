require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  test "should have a quality that defaults to 0" do
    idea = Idea.new
    assert_equal("swill", idea.quality)
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
