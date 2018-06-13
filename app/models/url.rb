class Url < ApplicationRecord
  validates :given_link,
    presence: true,
    format: URI::regexp(%w(http https)),
    uniqueness: true

  validates :count, presence: true
  validates :short_link, uniqueness: true

	after_create :create_short_link

	CHARSET = [*'0'..'9', *'a'..'z', *'A'..'Z', "_", "-"]
	BASE = 62


	def create_short_link
    id = self.id
    short_link = 6.times.map { CHARSET.sample }.join
	end

	def create_id_of_short_link(short_link)
		id = 0
    base = CHARSET.length
    short_link.each_char { |c| id = id * base + CHARSET.index(c) }
    id
	end
end