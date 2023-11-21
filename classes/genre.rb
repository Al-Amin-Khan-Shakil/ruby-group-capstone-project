class Genre < Item
    @name = name

    def add_item(item)
        @item = item
    end

    private
    @items = items
    @id = id
end