require('spec_helper')

describe(Venue) do
  it('validates presence of name') do
    venue = Venue.new({:name => ""})
    expect(venue.save()).to(eq(false))
  end

  it('capitalizes the user entry') do
    venue = Venue.create({:name => 'pavilion'})
    expect(venue.name()).to(eq('Pavilion'))
  end
end
