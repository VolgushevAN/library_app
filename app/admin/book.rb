ActiveAdmin.register Book do
  permit_params :year, :title, :description, :author, :picture
  
  form do |f|
    f.inputs 'Book details' do
      f.input :title
      f.input :picture, as: :file, hint: image_tag(f.object.picture.url(:thumb))
      f.input :description
      f.input :author
      f.input :year
    end
    f.actions
   end

  show do |book|
    attributes_table do
      row :title
      row :picture do
        image_tag(book.picture.url(:medium))
      end
      row :description
      row :author
      row :year
    end
  end

  index as: :table do
    selectable_column
    column :picture do |book|
      link_to image_tag(book.picture.url(:thumb), height: 60), admin_book_path(book)
    end
    column :title
    column :author
    column :description do |book|
      truncate(book.description, length: 250, separator: ' ')
    end
    column :year

    actions
  end

end
