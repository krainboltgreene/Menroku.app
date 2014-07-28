describe "Menroku" do
  let(:app) { NSApplication.sharedApplication }

  it "has a status menu" do
    expect(app.delegate.status_menu).not_to be(false)
  end

  it "has three menu items" do
    expect(app.delegate.status_menu.itemArray.length).to eq(3)
  end
end
