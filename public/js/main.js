document.addEventListener("DOMContentLoaded", () => {
    const container = document.getElementById("container");

    async function fetchTemplate(routeName) {
        const response = await fetch(`/${routeName}`);
        if (response.status !== 200) {
            throw new Error("Failed to get route!");
        }

        return response.text();
    }

    async function route(routeName) {
        const tpl = await fetchTemplate(routeName);
        container.innerHTML = tpl;
    }

    document.getElementById("btn_signin").addEventListener("click", () => {
        route("signin");
    });

    document.getElementById("btn_login").addEventListener("click", () => {
        route("login");
    });
});
