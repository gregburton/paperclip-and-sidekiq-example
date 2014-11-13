class AddStartTimeAndEndTimeToRingtones < ActiveRecord::Migration
  def change
    add_column :ringtones, :start_time, :time
    add_column :ringtones, :end_time, :time
  end
end
