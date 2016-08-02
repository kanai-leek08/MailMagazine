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

describe 'function search and paging' do
  it 'ページング確認：11件以上データがある場合 10件になること' do
    FactoryGirl.create_list(:article, 15)
    r = Article.search(1, '')
    expect(r.count).to eq 10
  end
  it 'ページング確認：2ページ指定が適切なデータ数であること' do
    FactoryGirl.create_list(:article, 15)
    r = Article.search(2, '')
    expect(r.count).to eq 5
  end
  it '検索確認：titleかbodyにマッチするデータで絞り込まれること' do
    FactoryGirl.create(:article, title: "this is title. ", body: 'this is body.')
    FactoryGirl.create(:article, title: "this is hoge. ", body: 'this is fuga.')
    r = Article.search(1, 'title')
    expect(r.count).to eq 1
    r = Article.search(1, 'body')
    expect(r.count).to eq 1
    r = Article.search(1, 'this')
    expect(r.count).to eq 2
  end
end
