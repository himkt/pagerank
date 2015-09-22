require 'spec_helper'

describe Pagerank do
  
  # check whether version is valid
  it 'has a version number' do
    expect(Pagerank::VERSION).not_to be nil
  end

  # check whether instance can create
  it 'creates a instance' do
    expect(PageRank::Main.new.class).to eq PageRank::Main
  end

  # check whether link can be created
  it 'add a link' do
    pr = PageRank::Main.new
    expect(pr.add("a","c").class).to eq Array
    expect(pr.add("b","c").class).to eq Array
    expect(pr.add("c","b").class).to eq Array
  end

  # check whether rank can be computed
  it 'calculate a pagerank' do
    pr = PageRank::Main.new
    pr.add("a","c")
    pr.add("b","c")
    pr.add("c","b")
    expect(pr.compute).to eq true
    expect(pr.score.class).to eq Hash
  end

end
