class Cni < ApplicationRecord
    validates_presence_of :name, presence: true, length: {in: 3..20}, uniqueness: true, message: "%{value} est Oblgatoire"
    validates_presence_of :numeroRecepisse, presence: true, message: "%{value} est Obligaoire", length: {in: 10..20}, uniqueness: true
    validates_uniqueness_of :name, presence: true, message: "%{value} existe deja"
    validates_uniqueness_of :numeroRecepisse, presence:true, message: "%{value} existe deja"
    validates_length_of :name, presence: true, minimum: 3, message: "doit avoir %{count} caracteres minimum"
end
