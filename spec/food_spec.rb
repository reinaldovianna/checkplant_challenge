require 'rails_helper'

describe Food do
    subject{ Food.new }

    describe "when time_hourglass_one is 5 and time_hourglass_two is 7" do
        before do
        subject.time_hourglass_one = 5
        subject.time_hourglass_two = 7
      end

        it "test time_cook 1 = 15 || Calc: (5 + 5 + 5) - (7 + 7)" do
            subject.time_cook = 1
            subject.cook_calculate
            expect(subject.result_calculator).to eq(15)
      end

      it "test time_cook 2 = 7 || Calc: 5 - 7" do
            subject.time_cook = 2
            subject.cook_calculate
            expect(subject.result_calculator).to eq(7)
      end

      it "test time_cook 3 = 10 || Calc: (5 + 5) - 7" do
            subject.time_cook = 3
            subject.cook_calculate
            expect(subject.result_calculator).to eq(10)
      end

      it "test time_cook 4 = 14 || Calc: (5 + 5) - (7 + 7)" do
            subject.time_cook = 4
            subject.cook_calculate
            expect(subject.result_calculator).to eq(14)
      end

      it "test time_cook 5 = 5" do
            subject.time_cook = 5
            subject.cook_calculate
            expect(subject.result_calculator).to eq(5)
      end

      it "test time_cook 7 = 7" do
            subject.time_cook = 7
            subject.cook_calculate
            expect(subject.result_calculator).to eq(7)
      end

      it "test time_cook 8 or greater show message" do
            subject.time_cook = 8
            expect { subject.cook_calculate }.to raise_error("Não é possível calcular o tempo de preparo com as ampulhetas informadas.")
      end
    end

    describe "when turning an hourglass is more advantageous" do
        before do
        subject.time_hourglass_one = 5
        subject.time_hourglass_two = 40
      end

      it "test time_cook 15 with time hourglass 5 and 40 equals 15" do
            subject.time_cook = 15
            subject.cook_calculate
            expect(subject.result_calculator).to eq(15)
      end

      it "test time_cook 45 with time hourglass 5 and 40 equals 15" do
            subject.time_cook = 45
            subject.cook_calculate
            expect(subject.result_calculator).to eq(45)
      end

      it "test time_cook 80 with time hourglass 5 and 40 equals 80" do
            subject.time_cook = 80
            subject.cook_calculate
            expect(subject.result_calculator).to eq(80)
      end
    end
end