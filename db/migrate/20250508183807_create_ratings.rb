class CreateRatings < ActiveRecord::Migration[8.0]
  def change
    create_table :ratings do |t|
      t.decimal :score, precision: 3, scale: 1
      t.text :comment

      t.timestamps

      t.check_constraint "score >= 0.0 AND score <= 10.0", name: "RatingsScoreRangeCheck"
    end
  end
end
