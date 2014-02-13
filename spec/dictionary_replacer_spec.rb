require 'spec_helper'

describe DictionaryReplacer do
  describe "#translate" do
    it "replaces an empty string with nothing" do
      string = ""
      dict = {}
      expect(subject.translate(string, dict)).to eq ""
     # input : "", dict empty, output:""
    end

    it "replaces temp token with dictionary value" do
      string = "$temp$"
      dict = {temp: "temporary"}

      expect(subject.translate(string, dict)).to eq("temporary")
    end


    # input : "$temp$ here comes the name $name$", dict ["temp", "temporary"] ["name", "John Doe"], output : "temporary here comes the name John Doe"

    it "replaces temp and name with the values in the dictionary" do
      string = "$temp$ here comes the name $name$"
      dict = {
        temp: "temporary",
        name: "John Doe"
      }

      expect(subject.translate(string, dict)).to eq("temporary here comes the name John Doe")
    end

    # input: "$foo$ \$foo\$"
    it "replaces foo with the values in the dictionary" do
      string = '$foo$ \$foo\$'
      dict = { foo:  "temporary" }

      expect(subject.translate(string, dict)).to eq('temporary \$foo\$')
    end

    it "returns string as it is when dict is empty" do
      string = "$this$ will $fail$"
      expect(subject.translate(string, {})).to eq(string)
    end

    it "doesnt escape backslash outside of the placeholder" do
      string = '$foo$ \ \$foo\$'
      dict = { foo:  "temporary" }
      expect(subject.translate(string, dict)).to eq('temporary \ \$foo\$')
    end

    it "does not replace not found tokens on dict" do
      string = "$this$ will $fail$"
      dict = { this: "that" }
      expect(subject.translate(string, dict)).to eq("that will $fail$")
    end
  end
end
