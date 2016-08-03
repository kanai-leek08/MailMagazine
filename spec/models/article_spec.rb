require 'spec_helper'

describe 'Validation' do
  it '正常入力' do
    article = Article.new(
      title: 'hoge',
      body: 'hoge',
      owner: 'hoge'
    )
    expect(article).to be_valid
  end
  it '必須チェック：titleが空' do
    article = Article.new(
      title: '',
      body: 'hoge',
      owner: 'hoge'
    )
    expect(article.valid?).to eql(false)
    expect(article.errors.full_messages).to eq(['タイトルを入力してください'])
  end
  it '必須チェック：titleがnil' do
    article = Article.new(
      title: nil,
      body: 'hoge',
      owner: 'hoge'
    )
    expect(article.valid?).to eql(false)
    expect(article.errors.full_messages).to eq(['タイトルを入力してください'])
  end
  it '必須チェック：bodyが空' do
    article = Article.new(
      title: 'hoge',
      body: '',
      owner: 'hoge'
    )
    expect(article.valid?).to eql(false)
    expect(article.errors.full_messages).to eq(['本文（Markdown)を入力してください'])
  end
  it '必須チェック：bodyがnil' do
    article = Article.new(
      title: 'hoge',
      body: nil,
      owner: 'hoge'
    )
    expect(article.valid?).to eql(false)
    expect(article.errors.full_messages).to eq(['本文（Markdown)を入力してください'])
  end
  it '必須チェック：ownerが空' do
    article = Article.new(
      title: 'hoge',
      body: 'hoge',
      owner: ''
    )
    expect(article.valid?).to eql(false)
    expect(article.errors.full_messages).to eq(['投稿者を入力してください'])

  end
  it '必須チェック：ownderがnil' do
    article = Article.new(
      title: 'hoge',
      body: 'hoge',
      owner: nil
    )
    article.valid?
    expect(article.valid?).to eql(false)
    expect(article.errors.full_messages).to eq(['投稿者を入力してください'])
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
