package middleware

import (
	"net/http"

	"github.com/go-kit/log/level"
	"github.com/grafana/mimir/pkg/util/spanlogger"
	"github.com/weaveworks/common/user"
)

type HTTPFakeAuth struct{}

func (h HTTPFakeAuth) Wrap(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		log, _ := spanlogger.New(r.Context(), "middleware.authFake.Wrap")
		defer log.Span.Finish()

		level.Warn(log).Log("msg", "middleware.authFake.Wrap started")

		ctx := user.InjectOrgID(r.Context(), "fake")
		next.ServeHTTP(w, r.WithContext(ctx))
	})
}
