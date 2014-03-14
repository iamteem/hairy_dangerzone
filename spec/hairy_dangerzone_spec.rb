require 'hairy_dangerzone'

describe HairyDangerzone::Awesome do
  before do
    class Hello
      include HairyDangerzone::Awesome
    end
  end

  context "is included in a class" do
    it "should add a class method called danger_danger" do
      expect(Hello).to respond_to(:danger_danger)
    end
  end

  describe ".danger_danger" do
    let(:hello) { Hello.new }
    before do
      class Hello
        attr_accessor :x

        danger_danger :x, "Not a string" do |at|
          at.is_a?(String)
        end
      end
    end

    context "when object assigned to attribute is invalid" do
      it "should raise an exception" do
        expect{ hello.x = 1212 }.to raise_error(Exception)
      end
    end

    context "when object assigned to attribute is invalid" do
      it "should raise an exception" do
        expect { hello.x = "1212" }.to_not raise_error(Exception)
      end

      it "should set the attribute" do
        hello.x = "1212"
        expect(hello.x).to eq("1212")
      end
    end
  end
end
