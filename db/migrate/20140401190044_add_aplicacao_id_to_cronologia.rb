class AddAplicacaoIdToCronologia < ActiveRecord::Migration
  def change
    add_index :cronologia, :aplicacao_id
  end
end
