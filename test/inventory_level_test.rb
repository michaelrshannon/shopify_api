require 'test_helper'

class InventoryLevelTest < Test::Unit::TestCase
  def test_get_inventory_item_inventory_levels
    fake 'inventory_levels.json?inventory_item_ids=1%2C2', extension: false, :method => :get, :body => load_fixture('inventory_item_inventory_levels')

    items = ShopifyAPI::InventoryLevel.find(:all, :params => {:inventory_item_ids => '1,2'})
    assert_equal [5, 2, 7], items.collect(&:available)
  end
end