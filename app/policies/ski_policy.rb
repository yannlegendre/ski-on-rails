class SkiPolicy < ApplicationPolicy
    def index?
      true
    end

    def show?
      true
    end

    def create?
      true
    end

    def new?
      create?
    end

    def update?
      false
    end

    def edit?
      update?
    end

    def destroy?
      false
    end

    def search?
      true
    end

  class Scope < Scope
      def resolve
        scope.all
      end
  end
end
