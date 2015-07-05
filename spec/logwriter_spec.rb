require 'spec_helper'
require './lib/logwriter'

describe Logwriter do
  it 'has a version number' do
    expect(Logwriter::VERSION).not_to be nil
  end

  path = './test.log'
  test_v = 'test'
  test_a = ['a', :b, 3]
  test_h = {key: 'value'}

  context 'initializeでオブジェクトを生成' do
    before do
      File.open(path, 'w'){}
    end

    logger = Logwriter::Logger.new(path)
    it 'loggerオブジェクトが生成されている' do
      expect(logger.class).to eq Logwriter::Logger
      expect(logger.target_filepath).to eq './test.log'
    end
  end

  describe '#rec_val' do
    before do
      File.open(path, 'w'){}
    end
    logger = Logwriter::Logger.new(path)

    it '変数を渡した時' do
      logger.rec_val(test_v)
      File.open(path) do |f|
        expect(f.gets).to match /value: "test"/
      end
    end

    it '配列を渡した時' do
      logger.rec_val(test_a)
      File.open(path) do |f|
        expect(f.gets).to match /value: \["a", :b, 3\]/
      end
    end

    it 'ハッシュを渡した時' do
      logger.rec_val(test_h)
      File.open(path) do |f|
        expect(f.gets).to match /value: {:key=>"value"}/
      end
    end

    it 'オブジェクトを渡した時' do
      obj = Object.new
      logger.rec_val(obj)
      File.open(path) do |f|
        expect(f.gets).to match /value: #<Object:.*>/
      end
    end
  end
  
  describe '#rec_class' do
    before do
      File.open(path, 'w'){}
    end
    logger = Logwriter::Logger.new(path)

    it '変数を渡した時' do
      logger.rec_class(test_v)
      File.open(path) do |f|
        expect(f.gets).to match /object: test, class: String, superclass: Object/
      end
    end

    it '配列を渡した時' do
      logger.rec_class(test_a)
      File.open(path) do |f|
        expect(f.gets).to match /object: \["a", :b, 3\], class: Array, superclass: Object/
      end
    end

    it 'ハッシュを渡した時' do
      logger.rec_class(test_h)
      File.open(path) do |f|
        expect(f.gets).to match /object: {:key=>"value"}, class: Hash, superclass: Object/
      end
    end

    it 'オブジェクトを渡した時' do
      obj = Object.new
      logger.rec_class(obj)
      File.open(path) do |f|
        expect(f.gets).to match /object: #<Object:.*>, class: Object, superclass: BasicObject/
      end
    end
  end

  describe '#put_flag' do
    before do
      File.open(path, 'w'){}
    end
    logger = Logwriter::Logger.new(path)
    it 'フラグ3を出力させた時' do 
      logger.put_flag(3)
      File.open(path) do |f|
        expect(f.gets).to match /\/~~  3 flaged/
      end
    end
  end

  after do
    File.delete('./test.log')
  end
end
