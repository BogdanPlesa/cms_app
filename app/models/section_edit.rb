class SectionEdit < ActiveRecord::Base

	belongs_to :editor, :class_name => "AdminUser", :foreign_key =>
	"admin_user_id" # because in thw adminuser table we don't have editor_id
	belongs_to :section

end
