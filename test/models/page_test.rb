require "test_helper"

class PageTest < ActiveSupport::TestCase

  # Draft
  test "draft returns true for draft post" do
    # binding.irb
    assert pages(:draft).draft?
  end

  test "draft returns false for published post" do
    # binding.irb
    refute pages(:published).draft?
  end

  test "draft returns false for scheduled post" do
    # binding.irb
    refute pages(:scheduled).draft?
  end

  # Published
  test "published returns true for published post" do
    # binding.irb
    assert pages(:published).published?
  end

  test "published returns false for draft post" do
    # binding.irb
    refute pages(:draft).published?
  end

  test "published returns false for scheduled post" do
    # binding.irb
    refute pages(:scheduled).published?
  end


  # Scheduled
  test "Scheduled returns true for Scheduled post" do
    # binding.irb
    assert pages(:scheduled).scheduled?
  end

  test "Scheduled returns false for draft post" do
    # binding.irb
    refute pages(:draft).scheduled?
  end

  test "Scheduled returns false for published post" do
    # binding.irb
    refute pages(:published).scheduled?
  end
end
