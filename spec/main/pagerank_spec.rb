require 'spec_helper'

describe Pagerank do
  it 'has a version number' do
    expect(Pagerank::VERSION).not_to be nil
  end

  it 'creates a instance' do
    expect(PageRank::Main.new.class).to eq PageRank::Main
  end

  it 'add a link' do
    pr = PageRank::Main.new
    expect(pr.add("a","c").class).to eq Array
    expect(pr.add("b","c").class).to eq Array
    expect(pr.add("c","b").class).to eq Array
  end

  it 'calculate a pagerank' do
    pr = PageRank::Main.new
    pr.add("a","c")
    pr.add("b","c")
    pr.add("c","b")
    expect(pr.calculate).to eq true
    expect(pr.score.class).to eq Hash
  end

end