require 'spec_helper'

describe Computer do
  it 'works for add and multiply' do
    computer = Computer.new('1,1,1,4,99,5,6,0,99')
    expect(computer.run.dump).to eq '30,1,1,4,2,5,6,0,99'
  end
end
