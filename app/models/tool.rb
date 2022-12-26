class Tool < ApplicationRecord
  belongs_to :user

  validates :alias, :sap, :layout, :plant, :bu, :technology, :customer, :volume, :max, :damaged, :blocked, :spares, presence: true

  validates_numericality_of :volume, :max, :damaged, :blocked, :spares, only_integer: true


end
