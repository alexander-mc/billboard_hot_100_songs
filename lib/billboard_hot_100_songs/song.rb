class BillboardHot100Songs::Song
 
    attr_accessor :name, :artist, :rank_this_week, :rank_last_week, :delta, :peak_rank, :duration
    
    @@all = []

    def initialize(song_hash)
        song_hash.each {|key, value| self.send("#{key}=", value)}
        self.class.all << self
    end

    def self.create_from_array(song_array)
        song_array.each {|song_hash| self.new(song_hash)}
    end

    def self.all
        @@all
    end

    # SONGS BY RANK

    def self.sort_by_rank_this_week
        self.all.sort_by {|song| song.rank_this_week.to_i}
    end

    # SONGS BY DURATION

    def self.select_new_songs
        self.sort_by_rank_this_week.select {|song| song.duration == "1"}
    end

    def self.sort_by_duration # By descending order
        self.all.sort_by {|song| song.duration.to_i}.reverse
    end

    def self.select_top_10_by_duration
        self.sort_by_duration[0, 10]
    end

    # SONGS BY PEAK RANK
    
    def self.select_no_1_peak_songs
        self.sort_by_rank_this_week.select {|song| song.peak_rank == "1"}
    end

    def self.sort_by_peak_rank
        self.all.sort_by {|song| song.peak_rank.to_i}
    end

    # UNUSED METHODS - MAY BE USEFUL FOR FUTURE PROGRAMS

    def self.find_by_rank_this_week(rank_this_week)
        self.all.find{|song| song.rank_this_week == rank_this_week}
    end

end