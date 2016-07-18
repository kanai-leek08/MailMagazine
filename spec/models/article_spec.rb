require 'spec_helper'

describe 'Validation' do
  it '必須チェック' do
    article = Article.new(
      title: 'hoge',
      body: 'hoge',
      owner: 'hoge'
    )
    expect(article).to be_valid
  end
end

describe '四則演算' do
  it '1 + 1 は 2 になること' do
    expect(1 + 1).to eq 2
  end
  it '10 - 1 は 9 になること' do
    expect(10 - 1).to eq 9
  end
end

describe 'func search' do
  FactoryGirl.create_list(:article, 11)
  it '11件以上データがある場合 10件になること' do
    r = Article.search(1, '')
    expect(r.count).to eq 10
  end
  it 'ページングが狙い通りの件数であること' do
    r = Article.search(2, '')
    expect(r.count).to eq 1
  end
end
