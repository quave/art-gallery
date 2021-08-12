class AddAttachmentImageToWorks < ActiveRecord::Migration[6.1]
  def up
    change_table :works do |t|
      t.attachment :image
    end
  end

  def down
    remove_attachment :works, :image
  end
end
