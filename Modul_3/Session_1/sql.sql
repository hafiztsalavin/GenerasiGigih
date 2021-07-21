-- detail salah
select items.id as id, items.name as name, items.price as price, categories.name as category_name
        from items 
        join categories  on items.id = categories.id 
        where items.id=1;

-- edit
update  items 
    join item_categories on items.id = item_categories.item_id 
    join categories  on items.id = categories.id 
set items.name = 'nasi goreng hongkong', items.price = '12000', item_categories.category_id ='2' where items.id = '1';


-- detail
select items.id as id, items.name as name, items.price as price, categories.name as category_name
        from items 
        join item_categories on items.id = item_categories.item_id 
        join categories  on item_categories.category_id = categories.id
        where items.id=1;

-- hapus
delete from items where id=1;