require_relative '../lib/route_deputes.rb'

describe "#get_deputy_names_and_urls" do
  it "renvoie un array compose de 2 arrays: dans le 1er, les noms et prenoms des deputes, dans le 2eme, les urls des pages de chaque depute" do
    expect(get_deputy_names_and_urls[1].size).to eq(577)
  end
end

describe "#get_deputy_emails(deputy_url)" do
  it "trouver l'email d'un député - l'url de la page de ce depute est donne en argument" do
    expect(get_deputy_emails("https://www.nosdeputes.fr/berangere-abba")).to eq("berangere.abba@assemblee-nationale.fr")
  end
end