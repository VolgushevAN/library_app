ActiveAdmin.register Library do
  permit_params :name, :address, book_presences_attributes: [:book_id, :count, :on_hands, :_destroy, :id]

  form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :address
    end
    f.inputs do 
      f.has_many :book_presences, heading: 'Books', allow_destroy: true, new_record: 'Add book' do |book_presence|
        book_presence.input :book
        book_presence.input :count
        book_presence.input :on_hands
      end
    end
    f.actions
  end

  show do
    panel 'Details', only: :show do
      attributes_table_for library do
        row :name
        row :address
      end
    end
    panel 'Books' do
      table_for library.book_presences do
        column :book
        column :on_hands
        column :count
      end
    end
    active_admin_comments
  end



end
