require 'test_helper'

class InventoryItemTest < Test::Unit::TestCase
  def test_get_inventory_items
    fake 'inventory_items.json?ids=3206163459739%2C3206163459740', extension: false, :method => :get, :body => load_fixture('inventory_items')

    items = ShopifyAPI::InventoryItem.find(:all, :params => {:ids => '3206163459739,3206163459740'})
    assert_equal %w[TEST-1 TEST-2], items.collect(&:sku)
  end

  def test_get_inventory_item
    fake 'inventory_items/3206163459739', :method => :get, :body => load_fixture('inventory_item')

    item = ShopifyAPI::InventoryItem.find(3206163459739)
    assert_equal 'TEST-1', item.sku
  end
end