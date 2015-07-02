require 'spec_helper'
require './lib/logwriter'

describe Logwriter do
  it 'has a version number' do
    expect(Logwriter::VERSION).not_to be nil
  end

  describe '#rec_val' do
      path = './test.log'
      logger = Logwriter::Logger.new(path)
      loged_strings = String.new

    context '変数の場合' do
      context '変数名を引数として渡す場合' do
        params = ['valiable', 'value']
        #        let(:path){'./test.log'}
        #        let(:params){['valiable', 'value']}
        logger.rec_val(params)
        File.open(path, 'r') do |f|
          loged_strings = f.gets
        end
        it 'ログ記録テキストがフォーマット通りの文字列であること' do
          expect("a").to eq "value: valiable\n"
        end
      end

      #      context '変数名を引数として渡さない場合' do
      #        let(:params) {['valiable', 'val']}
      #        logger.rec_val(param)
      #        logfile eq("val: valiable\n") 
      #      end

    end
    #    context '配列の場合' do
    #      context '配列名を引数として渡す場合' do
    #        arrayval = Array.new('a', 'b', 3)
    #        let(:params) {[arrayval, 'arrayval']}
    #        logger.rec_val(param)
    #        logfile eq(q(arrayval: ["a", "b", 3])) 
    #      end
    #
    #      context '配列名を引数として渡さない場合' do
    #        let(:params) {['a', 'b', 3]}
    #        logger.rec_val(param)
    #        logfile eq(q(value: ["a", "b", 3])) 
    #      end
    #    end
    #    context 'ハッシュの場合' do
    #    end
    #  end
    #
    #  describe '#rec_class' do
    #  end
    #
    #  describe '#put_flag' do
    #  end
    #
    #  it 'does something useful' do
    #    before
    #
  end
end
