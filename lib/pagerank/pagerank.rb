=begin
u   : webpage
F_u : the set of pages u points to
B_u : the set of pages that point to u
N_u : |F_u|
c   : use for normalization
R(u): c * \sum_{v} \in{B_u} R(v)/N_v
=end

module PageRank

  class Main
    attr_reader :nodes, :follow_links, :score

    # creat instance
    def initialize
      @nodes        = []
      @score        = {}
      @follow_links = {}
      @back_links = {}
      @iterates = 0
    end

    # divide among initial value
    def initial_value
      @nodes.each do |node|
        @score[node] = 1.0 / @nodes.size
      end
    end

    # add node into nodes and edge into follow_links
    def add from, to
      @nodes << from unless @nodes.include?(from)
      @nodes << to unless @nodes.include?(to)
      @follow_links[from] ||= []
      @follow_links[from] << to
      @back_links[to] ||= []
      @back_links[to] << from
    end

    # calculate pagerank
    def calculate
      if @score == {}
        initial_value
      end

      @score.each do |from, value|
        if @back_links[from]
          score = @score[from]
          @back_links[from].each do |to|
            score += @score[to]
          end
          @score[from] = score
        else
          @score[from] = 0
        end
      end

      @iterates += 1
      # return true if convergence?
      return calculate unless @iterates == 1
      return true
    end

    # check convergence
    def convergence? convergence=0.01
      return (convergence < 1.0)
    end

  end

end
