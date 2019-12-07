require 'spec_helper'

describe Computer do
  it 'works for add and multiply' do
    computer = Computer.new('1,1,1,4,99,5,6,0,99')
    expect(computer.run.dump).to eq '30,1,1,4,2,5,6,0,99'
  end

  it 'works with parameter modes' do
    result = Computer.new('1002,4,3,4,33').run.dump
    expect(result).to eq '1002,4,3,4,99'
  end

  it 'tests for "8" using position mode' do
    log = StringIO.new
    computer = Computer.new('3,9,8,9,10,9,4,9,99,-1,8', log: log, input: 8).run
    expect(computer.read_log).to eq "1\n"

    log = StringIO.new
    computer = Computer.new('3,9,8,9,10,9,4,9,99,-1,8', log: log, input: 7).run
    expect(computer.read_log).to eq "0\n"
  end

  describe 'equals-8 program with position mode' do
    let(:computer) { Computer.new('3,9,8,9,10,9,4,9,99,-1,8', log: StringIO.new) }

    it 'logs 0 if input is not 8' do
      computer.input = [9]
      expect(computer.run.read_log).to eq "0\n"
    end

    it 'logs 1 if input equals 8' do
      computer.input = [8]
      expect(computer.run.read_log).to eq "1\n"
    end
  end

  describe 'less-than-8 program with position mode' do
    let(:computer) { Computer.new('3,9,7,9,10,9,4,9,99,-1,8', log: StringIO.new) }

    it 'logs 1 if input is less than 8' do
      computer.input = [7]
      expect(computer.run.read_log).to eq "1\n"
    end

    it 'logs 0 if input higher than 8' do
      computer.input = [9]
      expect(computer.run.read_log).to eq "0\n"
    end

    it 'logs 0 if input equals 8' do
      computer.input = [8]
      expect(computer.run.read_log).to eq "0\n"
    end
  end

  describe 'less-than-8 program with immediate mode' do
    let(:computer) { Computer.new('3,3,1107,-1,8,3,4,3,99', log: StringIO.new) }

    it 'logs 1 if input is less than 8' do
      computer.input = [7]
      expect(computer.run.read_log).to eq "1\n"
    end

    it 'logs 0 if input higher than 8' do
      computer.input = [9]
      expect(computer.run.read_log).to eq "0\n"
    end

    it 'logs 0 if input equals 8' do
      computer.input = [8]
      expect(computer.run.read_log).to eq "0\n"
    end
  end

  describe 'jump-test program' do
    it 'works in position mode' do
      computer = Computer.new('3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9', log: StringIO.new, input: 1)
      expect(computer.run.read_log).to eq "1\n"
    end

    it 'works in immediate mode' do
      computer = Computer.new('3,3,1105,-1,9,1101,0,0,12,4,12,99,1', log: StringIO.new, input: 1)
      expect(computer.run.read_log).to eq "1\n"
    end
  end

  describe '1000-and-8-night-program' do
    let(:computer) { Computer.new('3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99', log: StringIO.new) }

    it 'returns 999 for lower-8' do
      computer.input = [7]
      expect(computer.run.read_log).to eq "999\n"
    end

    it 'returns 1000 for 8' do
      computer.input = [8]
      expect(computer.run.read_log).to eq "1000\n"
    end

    it 'returns 1001 for higher-than-8' do
      computer.input = [123323]
      expect(computer.run.read_log).to eq "1001\n"
    end
  end
end
