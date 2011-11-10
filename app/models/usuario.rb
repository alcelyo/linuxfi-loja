class Usuario < ActiveRecord::Base

  attr_accessor :senha, :termos_e_condicoes

  validates_presence_of     :nome, :email

  validates_uniqueness_of   :email

  validates_acceptance_of   :termos_e_condicoes, :if => :new_record?

  validates_presence_of     :senha_em_hash, :if => :senha_necessaria?

  validates_confirmation_of :senha, :if => :senha_necessaria?

  validates_length_of       :senha, :within => 4..40, :if => :senha_necessaria?

end