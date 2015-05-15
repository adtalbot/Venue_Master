require('spec_helper')

describe(Band) do
  it('validates to presence of name') do
    band = Band.new({:name => "",})
    expect(band.save()).to(eq(false))
  end

  it('capitalizes the user entry') do
    band = Band.create({:name => 'aerosmith'})
    expect(band.name()).to(eq("Aerosmith"))
  end
end
