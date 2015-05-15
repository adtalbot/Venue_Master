require('spec_helper')

describe(Venue) do
  it('validates presence of name') do
    venue = Venue.new({:name => ""})
    expect(venue.save()).to(eq(false))
  end
end
