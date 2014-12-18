module Popolo
  # A real person, alive or dead.
  class Person
    include Mongoid::Document
    include Mongoid::Timestamps

    store_in Popolo.storage_options_per_class.fetch(:Person, Popolo.storage_options)

    # The person's memberships.
    has_many :memberships, class_name: 'Popolo::Membership', dependent: :destroy
    # The person's motions.
    has_many :motions, class_name: 'Popolo::Motion'
    # The person's votes.
    has_many :votes, as: :voter, class_name: 'Popolo::Vote'
    # Alternate or former names.
    embeds_many :other_names, as: :nameable, class_name: 'Popolo::OtherName'
    # Issued identifiers.
    embeds_many :identifiers, as: :identifiable, class_name: 'Popolo::Identifier'
    # Means of contacting the person.
    embeds_many :contact_details, as: :contactable, class_name: 'Popolo::ContactDetail'
    # URLs to documents about the person.
    embeds_many :links, as: :linkable, class_name: 'Popolo::Link'
    # URLs to documents from which the person is derived.
    embeds_many :sources, as: :linkable, class_name: 'Popolo::Link'

    # A person's preferred full name.
    field :name, type: String
    # One or more family names.
    field :family_name, type: String
    # One or more primary given names.
    field :given_name, type: String
    # One or more secondary given names.
    field :additional_name, type: String
    # One or more honorifics preceding a person's name.
    field :honorific_prefix, type: String
    # One or more honorifics following a person's name.
    field :honorific_suffix, type: String
    # One or more patronymic names.
    field :patronymic_name, type: String
    # A name to use in an lexicographically ordered list.
    field :sort_name, type: String
    # A preferred email address.
    field :email, type: String
    # A gender.
    field :gender, type: String
    # A date of birth.
    field :birth_date, type: DateString
    # A date of death.
    field :death_date, type: DateString
    # A URL of a head shot.
    field :image, type: String
    # A one-line account of a person's life.
    field :summary, type: String
    # An extended account of a person's life.
    field :biography, type: String
    # A national identity.
    field :national_identity, type: String

    validates_format_of :birth_date, with: DATE_STRING_FORMAT, allow_blank: true
    validates_format_of :death_date, with: DATE_STRING_FORMAT, allow_blank: true
    # @note Add email address validation and URL validation to match JSON Schema?

    def to_s
      if name.blank?
        if given_name.present? && family_name.present?
          "#{given_name} #{family_name}"
        elsif given_name.present?
          given_name
        elsif family_name.present?
          family_name
        else
          name
        end
      else
        name
      end
    end
  end
end
