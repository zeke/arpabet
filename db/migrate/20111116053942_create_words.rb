class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :spelling
      t.string :arpabet_transcription

      t.timestamps
    end
    
    add_index :words, :spelling
    add_index :words, :arpabet_transcription
  end
  
end
