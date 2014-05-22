class Language < ActiveRecord::Base
  validates :name, presence:true
  validates :code, presence:true, uniqueness:true, length: { maximum: 2 }

  def self.getMissingLangs
    activeLangs = Language.all.select("code").map(&:code)
    langs = [{:name => "Inglês", :code => "en"},
             {:name => "Francês", :code => "fr"},
             {:name => "Alemão", :code => "de"},
             {:name => "Italiano", :code => "it"},
             {:name => "Espanhol", :code => "es"},
             {:name => "Grego", :code => "el"},
             {:name => "Russo", :code => "ru"},
             {:name => "Holandês", :code => "nl"},
             {:name => "Turco", :code => "tr"},
             {:name => "Sueco", :code => "sv"}
    ]
    langs = langs.select{ |l| not activeLangs.include? l[:code]}
    return langs
  end
end
