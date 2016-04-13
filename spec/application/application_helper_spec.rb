require "rails_helper"

RSpec.describe ApplicationHelper, :type => :helper do
  describe "#limit_chars" do
    it "limits the number of characters in a string" do
      expect(ApplicationHelper::limit_chars("superlongtestingword", 3)).to eq("sup...")
    end
  end
  describe "#convert_resources_to_links" do
    it "converts string into array of imgur and youtube links" do
      from_user = "[+]https://www.youtube.com/watch?v=Lt-U_t2pUHI[+]https://www.youtube.com/watch?v=f62Z8Ev9OXA(+)[+]http://i.imgur.com/InL5xpt.png[+]http://i.imgur.com/4dr3B4z.jpg"

      converted = ApplicationHelper::convert_resources_to_links(from_user)
      expect(converted).to eq([["https://www.youtube.com/embed/Lt-U_t2pUHI", "https://www.youtube.com/embed/f62Z8Ev9OXA"],
 ["http://i.imgur.com/InL5xpt.png", "http://i.imgur.com/4dr3B4z.jpg"]])
    end
  end
  describe "#valid youtube link" do
    it "checks to make sure elements of url match whats needed for youtube`" do
      expect(ApplicationHelper::valid_youtube?("https://www.youtube.com/embed/f62Z8Ev9OXA")).to eq(true)
    end
    it "checks to make sure elements of url do NOT match whats needed for youtube" do
      expect(ApplicationHelper::valid_youtube?("akldjfa;ldjkf.com")).to eq(false)
    end
  end
  describe "#valid imgur link" do
    it "checks to make sure elements of url match whats needed for imgur" do
      expect(ApplicationHelper::valid_imgur?("http://i.imgur.com/6YXkgPP.png?1")).to eq(true)
    end
    it "checks to make sure elements of url do NOT match whats needed for imgur" do
      expect(ApplicationHelper::valid_imgur?("http://i.asdfasdf.asdfcom/6asdfYXkgPP.png?1")).to eq(false)
    end
  end
  describe "#sort_issues_by_severity" do
    it "filters an array of issues by severity" do
      issues = []
      sorted_issues = [Issue.new(severity: "Very Important"),
                       Issue.new(severity: "Very Important"),
                       Issue.new(severity: "Important"),
                       Issue.new(severity: "Important"),
                       Issue.new(severity: "Not Important"),
                       Issue.new(severity: "Not Important"),
                       Issue.new(severity: "Not Important")]
      for i in 0..6
        if i < 3
          issues.push(Issue.new(severity: "Not Important"))
        elsif i < 5
          issues.push(Issue.new(severity: "Important"))
        else
          issues.push(Issue.new(severity: "Very Important"))
        end
      end
      issues = ApplicationHelper::sort_issues_by_severity(issues)

      issues_sev = []
      sorted_sev= []
      count = 0
      sorted_issues.each do |s|
        issues_sev.push s.severity
        sorted_sev.push issues[count].severity
        count += 1
      end
      expect(issues_sev).to match_array(sorted_sev)
    end
  end
  describe "#convert UTC to local time" do
    it 'converts time to local time' do
      current_time = Time.now
      expect(ApplicationHelper::convert_to_readable_time(current_time)).not_to equal(current_time)
    end
  end
end
