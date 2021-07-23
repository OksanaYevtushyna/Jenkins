describe("when a gam ad is loaded on the page", () => {

    beforeEach(() => {

        cy.visit("cypress/sandbox/gpt-page.html");
        cy.intercept("http://mockurl.com/").as("sendMetrics");

        cy.clock();

    });

    it("should have the correct size", () => {

        cy.window().then(window => {

            // cy.wait(5000);
            cy.tick(5000);

            cy.get("#ad-wrapper>div>iframe").then(iframe => {

                console.log(iframe);
                const adSize = iframe[0].getBoundingClientRect();

                expect(adSize.width).to.equal(300);
                expect(adSize.height).to.equal(250);

            });

        });

    });

    it("should have the correct targeting set", () => {

        cy.window().then(window => {

            cy.wait(1000);

            const slot = window["googletag"].pubads().getSlots()[0];

            expect(slot.getTargeting("sovrn-reload")[0]).to.equal("true");

        });

    });

});
